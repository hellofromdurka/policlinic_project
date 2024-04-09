from flask import Flask, Blueprint, render_template, request, current_app, session, redirect, flash, url_for
from database.sql_provider import SQLProvider
from database.operations import select_from_db, default_statement, call_proc
from decorators.check_login import login_required, role_required

appointment_app = Blueprint('appointment_app', __name__, template_folder='templates')
sql_provider = SQLProvider('sql')


def get_free_appointment():
    sql_statement = sql_provider.get('select_free_appointment.sql', {})
    return select_from_db(current_app.config['MYSQL_DB_CONFIG'], sql_statement)


@appointment_app.route('/', methods=['GET', 'POST'])
@login_required(session)
@role_required(session)
def index_appointment():
    appointment = get_free_appointment()

    if request.method == 'POST':
        if not request.form.get('card_number'):
            flash('Пустой ввод', 'error')
            return redirect(url_for('appointment_app.index_appointment'))

        session.setdefault('appointment', []).append(
            {'timetable_id': request.form.get('timetable_id'), 
             'appointment_date': request.form.get('appointment_date'), 
             'appointment_time': request.form.get('appointment_time'), 
             'passport': request.form.get('passport'), 
             'specialization': request.form.get('specialization'),
             'appointment_room': request.form.get('appointment_room'), 
             'appointment_patient': request.form.get('card_number')})
        session.modified = True

        for t in session['appointment']:
            for app in appointment:
                if str(app['timetable_id']) == str(t['timetable_id']):
                    appointment.remove(app)
    
        return render_template('index_appointment.html', timetable=appointment, create_flag=True)

    return render_template('index_appointment.html', timetable=appointment)


@appointment_app.route('/show', methods=['GET'])
@login_required(session)
@role_required(session)
def show_appointment_handler():
    appointment = session.get('appointment')
    if not appointment:
        flash('Ваша корзина пуста', 'error')
        return redirect(url_for('appointment_app.index_appointment'))

    return render_template('order_list.html', timetable=appointment)


@appointment_app.route('/delete', methods=['GET', 'POST'])
@login_required(session)
@role_required(session)
def delete_appointment_handler():
    session.pop('appointment', None)
    return redirect(url_for('appointment_app.index_appointment'))


@appointment_app.route('/delete-current', methods=['POST'])
@login_required(session)
@role_required(session)
def delete_current_appointment():
    appointment = session.get('appointment', [])
    session['appointment'] = [t for t in appointment if t['timetable_id']
                         != request.form.get('timetable_id')]
    session.modified = True

    return redirect('/appointment/show')


@appointment_app.route('/create-order', methods=['POST'])
@login_required(session)
@role_required(session)
def create_order():
    for t in session['appointment']:
        id = t['timetable_id']
        patient = t['appointment_patient']
        sql_statement = sql_provider.get(
            'add_appointment.sql', {'patient': patient, 'id': id})
        default_statement(current_app.config['MYSQL_DB_CONFIG'], sql_statement)

    flash('Запись на прием подтверждена', 'create_order')
    return redirect(url_for('appointment_app.index_appointment'))