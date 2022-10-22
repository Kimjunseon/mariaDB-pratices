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

try:
    bookmall = connetion()
    cursor = bookmall.cursor()
    sql = 'insert into orders(no, member_no, order_number, price_amount) values(1, 1, 221001001, 0)'
    cursor.execute(sql)
    bookmall.commit()
    cursor.close()
    bookmall.close()
except:
    print(end='')
def select_model_orders():
    bookmall = connetion()
    cursor = bookmall.cursor(DictCursor)
    sql = "select b.member_name, d.book_name, sum(d.price * c.book_count) as price, d.book_number, sum(c.book_count), a.order_number, b.address from  orders a, member b, cart c, book d where a.no = b.no and c.member_no = b.no and d.no = c.no group by b.member_name order by a.no desc"
    cursor.execute(sql)
    results = cursor.fetchall();
    cursor.close()
    bookmall.close()
    return results
