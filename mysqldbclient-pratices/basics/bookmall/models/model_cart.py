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
    sql = 'insert into cart(no, member_no, book_no, book_count) values(%s, %s, %s, %s)'
    val = [(1, 1, 1, 2), (2, 1, 2, 1)]
    cursor.executemany(sql, val)
    bookmall.commit()
    cursor.close()
    bookmall.close()

except:
    print(end='')

def select_model_cart():
    bookmall = connetion()
    cursor = bookmall.cursor(DictCursor)
    sql = "select b.book_name, a.book_count, b.price from cart a, book b where a.no = b.no order by a.no desc"
    cursor.execute(sql)
    results = cursor.fetchall();
    cursor.close()
    bookmall.close()
    return results
