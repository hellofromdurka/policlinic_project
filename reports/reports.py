# from flask import Flask, Blueprint, render_template, request, current_app, session, redirect, flash, url_for
# from database.sql_provider import SQLProvider
# from database.operations import select_from_db, default_statement, call_proc
# from decorators.check_login import login_required, role_required

# reports_app = Blueprint('reports_app', __name__, template_folder='templates')
# sql_provider = SQLProvider('sql')


# @reports_app.route('/')
# @login_required(session)
# @role_required(session)
# def reports_index_handler():
#     return render_template('reports_index.html', role=session['role'])


# @reports_app.route('/create-docs', methods=['GET', 'POST'])
# @login_required(session)
# @role_required(session)
# def report_create_docs():
#     if request.method == 'GET':
#         return render_template('create_reports.html')
#     else:
#         date = request.form.get('date')
#         if not date:
#             return render_template('create_reports.html', message='Пустой ввод')

#         result = call_proc(
#             current_app.config['MYSQL_DB_CONFIG'], 'doc_visit_report', f'{date}-01')
#         if result:
#             return render_template('create_reports.html', message=result)

#         return render_template('create_reports.html', create_flag=True)


# @reports_app.route('/view-docs', methods=['GET'])
# @login_required(session)
# @role_required(session)
# def show_reports_handler_GET():
#     return render_template('view_reports.html')


# @reports_app.route('/view-docs', methods=['POST'])
# @login_required(session)
# @role_required(session)
# def show_reports_handler_POST():
#     date = request.form.get('date')
#     if not date:
#         return render_template('view_reports.html', error=13)
#     sql_statement = sql_provider.get(
#         'select_reports.sql', {'date': date})
#     result = select_from_db(current_app.config['MYSQL_DB_CONFIG'], sql_statement)
#     if not result:
#         return render_template('view_reports.html', error=14)
#     return render_template('view_reports.html', reports=result)
# ###

# @reports_app.route('/create-diagnosis', methods=['GET', 'POST'])
# @login_required(session)
# @role_required(session)
# def report_create_diagnosis():
#     if request.method == 'GET':
#         return render_template('create_reports2.html')
#     else:
#         date = request.form.get('date')
#         if not date:
#             return render_template('create_reports2.html', message='Пустой ввод')

#         result = call_proc(
#             current_app.config['MYSQL_DB_CONFIG'], 'diagnosis_report', f'{date}-01')
#         if result:
#             return render_template('create_reports2.html', message=result)

#         return render_template('create_reports2.html', create_flag=True)


# @reports_app.route('/view-diagnosis', methods=['GET'])
# @login_required(session)
# @role_required(session)
# def show_reports_diagnosis_handler_GET():
#     return render_template('view_reports2.html')


# @reports_app.route('/view-diagnosis', methods=['POST'])
# @login_required(session)
# @role_required(session)
# def show_reports_diagnosis_handler_POST():
#     date = request.form.get('date')
#     if not date:
#         return render_template('view_reports2.html', error=13)
#     sql_statement = sql_provider.get(
#         'select_reports2.sql', {'date': date})
#     result = select_from_db(current_app.config['MYSQL_DB_CONFIG'], sql_statement)
#     if not result:
#         return render_template('view_reports2.html', error=14)
#     return render_template('view_reports2.html', reports=result)


from flask import Blueprint, render_template, session, current_app, request, redirect, flash, url_for

from database.sql_provider import SQLProvider
from database.operations import select_from_db, call_proc

from decorators.check_login import login_required, role_required

reports_app = Blueprint('reports_app', __name__, template_folder='templates')
sql_provider = SQLProvider('sql')


def query_execution(key, sql_statement_name):
    data = request.form.get(key)

    if not data:
        return False, "Данные не введены"

    sql_statement = sql_provider.get(sql_statement_name, {key: data})
    result = select_from_db(
        current_app.config['MYSQL_DB_CONFIG'], sql_statement)

    if not result:
        return False, "Отчет не найден"

    return True, result


@reports_app.route('/')
@login_required(session)
@role_required(session)
def reports_index():
    return render_template('reports_index.html', reports=current_app.config['reports_list'])


def get_report():
    if request.method == 'GET':
        rep_id = request.args.get('rep_id')
        print(rep_id, 1)
    elif request.method == 'POST':
        rep_id = request.form.get('rep_id')
        print(rep_id, 2)

    try:
        report = next(
            report for report in current_app.config['reports_list'] if report['rep_id'] == rep_id)
        print(report)
    except StopIteration:
        flash('Отчет не найден', 'error')
        return None

    return report


@reports_app.route('/view-report', methods=['GET', 'POST'])
@login_required(session)
@role_required(session)
def view_report():
    report = get_report()
    if report is None:
        return redirect('/reports')

    if request.method == 'GET':
        return render_template('view_reports.html', name=report['rep_name'], rep_id=report['rep_id'])
    elif request.method == 'POST':
        check_flag, result = query_execution('date', report['sql_statement'])
        if check_flag:
            return render_template('view_reports.html', name=report['rep_name'], rep_id=report['rep_id'], reports=result)
        else:
            flash(result, 'error')
            return redirect(url_for('reports_app.view_report', rep_id=report['rep_id']))


@reports_app.route('/create-report', methods=['GET', 'POST'])
@login_required(session)
@role_required(session)
def create_report():
    report = get_report()
    if report is None:
        return redirect('/reports')

    if request.method == 'GET':
        return render_template('create_reports.html', name=report['rep_name'], rep_id=report['rep_id'])
    elif request.method == 'POST':
        procedure = report['procedure']
        date = request.form.get('date')

        result = call_proc(
            current_app.config['MYSQL_DB_CONFIG'], procedure, f'{date}-01')
        print(result)

        if result:
            flash(result, 'error')
        else:
            flash('Отчет успешно создан', 'okay')
        return redirect(url_for('reports_app.create_report', rep_id=report['rep_id']))
