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
def select_model_book():
    bookmall = connetion()
    cursor = bookmall.cursor(DictCursor)
    sql = "select book_name, price from book order by no desc"
    cursor.execute(sql)
    results = cursor.fetchall();
    cursor.close()
    bookmall.close()
    return results
