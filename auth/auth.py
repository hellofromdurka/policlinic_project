from flask import Blueprint, render_template, session, current_app, request, redirect
from database.sql_provider import SQLProvider
from database.operations import check_connection, select_from_db

auth_app = Blueprint('auth_app', __name__, template_folder='templates')
sql_provider = SQLProvider('auth/sql')


@auth_app.route('/')
def auth_handler():
    return render_template('auth.html', message='')


@auth_app.route('/login', methods=['POST'])
def login_handler():
    name, password = request.form['login'], request.form['password']
    data = {'user': name, 'password': password}

    if not name or not password:
        return render_template('auth.html', message='Логин или пароль не заполнен')

    sql_statement = sql_provider.get(
        'check_role.sql', {'login': data['user'], 'password': data['password']})
    connect = select_from_db(
        current_app.config['MYSQL_DB_CONFIG'], sql_statement)

    if connect:
        session['user'] = name
        session['password'] = password
        session['is_auth'] = True
        session['role'] = connect[0]['role']
        return redirect('/')
    else:
        return render_template('auth.html', message='Неправильный логин или пароль')


@auth_app.route('/logout', methods=['GET'])
def logout_handler():
    session.clear()
    return redirect('/')
