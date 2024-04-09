from flask import Flask, Blueprint, render_template, request, current_app, session, redirect, flash, url_for
from database.sql_provider import SQLProvider
from database.operations import select_from_db, default_statement, call_proc
from decorators.check_login import login_required, role_required

visit_app = Blueprint('visit_app', __name__, template_folder='templates')
sql_provider = SQLProvider('sql')


@visit_app.route('/')
@login_required(session)
@role_required(session)
def show_visit_handler():
    sql_statement = sql_provider.get('select_visit.sql', {})
    result = select_from_db(current_app.config['MYSQL_DB_CONFIG'], sql_statement)
    return render_template('visit.html', result=result)


@visit_app.route('/add-visit', methods=['POST'])
@login_required(session)
@role_required(session)
def add_visit_handler():
    id = str(dict(request.form).popitem()[0])
    if not request.form.get('diagnosis') or not request.form.get('complaints') or not request.form.get('prescription'):
        flash('Пустой ввод')
        return redirect(url_for('visit_app.show_visit_handler'))
    sql_statement = sql_provider.get(
            'add_visit.sql', {'diagnosis': f"\'{request.form.get('diagnosis')}\'", 
            'complaints': f"\'{request.form.get('complaints')}\'",
            'prescription': f"\'{request.form.get('prescription')}\'", 
            'id': id})

    default_statement(current_app.config['MYSQL_DB_CONFIG'], sql_statement)
    return redirect('/visit')