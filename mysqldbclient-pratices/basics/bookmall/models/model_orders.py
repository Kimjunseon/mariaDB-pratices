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
def select_model_orders():
    bookmall = connetion()
    cursor = bookmall.cursor(DictCursor)
    sql = "select a.order_number, b.member_name, a.price_amount, a.address from orders a, member b where a.no = b.no order by order_number desc"
    cursor.execute(sql)
    results = cursor.fetchall();
    cursor.close()
    bookmall.close()
    return results
