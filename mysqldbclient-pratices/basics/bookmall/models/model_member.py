from MySQLdb import connect
from MySQLdb.cursors import DictCursor

def connetion():
    bookmall = connect(user='bookmall',
                        password='bookmall',
                        host='127.0.0.1',
                        port=3306,
                        db='bookmall',
                        charset='utf8')
    return  bookmall
def select_model_member():
    bookmall = connetion()
    cursor = bookmall.cursor(DictCursor)
    sql = "select member_name, phone_number, member_mail, member_password from member order by no desc"
    cursor.execute(sql)
    results = cursor.fetchall();
    cursor.close()
    bookmall.close()
    return results
