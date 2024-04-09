from flask import Flask, Blueprint, render_template, request, current_app, session, redirect, flash, url_for
from database.sql_provider import SQLProvider
from database.operations import select_from_db, default_statement, call_proc
from decorators.check_login import login_required, role_required

timetable_app = Blueprint('timetable_app', __name__, template_folder='templates')
sql_provider = SQLProvider('sql')


@timetable_app.route('/')
@login_required(session)
@role_required(session)
def show_timetable_handler():
    sql_statement = sql_provider.get('select_timetable.sql', {})
    result = select_from_db(current_app.config['MYSQL_DB_CONFIG'], sql_statement)
    return render_template('timetable.html', result=result)


@timetable_app.route('/add-appearance', methods=['POST'])
@login_required(session)
@role_required(session)
def add_appearance_handler():
    appearance = request.form.get('appearance')
    id = str(dict(request.form).popitem()[0])
    if not appearance:
        flash('Пустой ввод', 'error')
        return redirect('/timetable')
    
    sql_statement = sql_provider.get(
            'add_appearance.sql', {'appearance': appearance, 'id': id})
    default_statement(current_app.config['MYSQL_DB_CONFIG'], sql_statement)
    return redirect('/timetable')


@timetable_app.route('/search-by-date', methods=['GET'])
@login_required(session)
@role_required(session)
def search_timetable_by_date_handler_GET():
    return render_template('search_by_date.html')


@timetable_app.route('/search-by-date', methods=['POST'])
@login_required(session)
@role_required(session)
def search_timetable_by_date_handler_POST():
    date = request.form.get('date')
    if not date:
        return render_template('search_by_date.html', error=13)
    sql_statement = sql_provider.get(
        'select_tmtbl_by_date.sql', {'date': date})
    result = select_from_db(current_app.config['MYSQL_DB_CONFIG'], sql_statement)
    if not result:
        return render_template('search_by_date.html', error=14)
    return render_template('search_by_date.html', timetable=result)


@timetable_app.route('/search-by-doc', methods=['GET'])
@login_required(session)
@role_required(session)
def search_timetable_by_doc_handler_GET():
    return render_template('search_by_doc.html')


@timetable_app.route('/search-by-doc', methods=['POST'])
@login_required(session)
@role_required(session)
def search_timetable_by_doc_handler_POST():
    doc = request.form.get('doc')
    print(request.form)
    if not doc:
        return render_template('search_by_doc.html', error=13)
    sql_statement = sql_provider.get(
        'select_tmtbl_by_doc.sql', {'doc': doc})
    print(sql_statement)
    result = select_from_db(current_app.config['MYSQL_DB_CONFIG'], sql_statement)
    if not result:
        return render_template('search_by_doc.html', error=14)
    return render_template('search_by_doc.html', timetable=result)


@timetable_app.route('/search-by-spec', methods=['GET'])
@login_required(session)
@role_required(session)
def search_timetable_by_spec_handler_GET():
    return render_template('search_by_spec.html')


@timetable_app.route('/search-by-spec', methods=['POST'])
@login_required(session)
@role_required(session)
def search_timetable_by_spec_handler_POST():
    spec = request.form.get('spec')
    if not spec:
        return render_template('search_by_spec.html', error=13)
    sql_statement = sql_provider.get(
        'select_tmtbl_by_spec.sql', {'spec': spec})
    result = select_from_db(current_app.config['MYSQL_DB_CONFIG'], sql_statement)
    if not result:
        return render_template('search_by_spec.html', error=14)
    return render_template('search_by_spec.html', timetable=result)


@timetable_app.route('/search-by-patient', methods=['GET'])
@login_required(session)
@role_required(session)
def search_timetable_by_patient_handler_GET():
    return render_template('search_by_patient.html')

@timetable_app.route('/search-by-patient', methods=['POST'])
@login_required(session)
@role_required(session)
def search_timetable_by_patient_handler_POST():
    patient = request.form.get('patient')
    print(request.form)
    if not patient:
        return render_template('search_by_patient.html', error=13)
    sql_statement = sql_provider.get(
        'select_tmtbl_by_patient.sql', {'patient': patient})
    print(sql_statement)
    result = select_from_db(current_app.config['MYSQL_DB_CONFIG'], sql_statement)
    if not result:
        return render_template('search_by_patient.html', error=14)
    return render_template('search_by_patient.html', timetable=result)