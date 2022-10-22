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
    sql = 'insert into book(no, catagory_no, book_name, price, book_number) values(%s, %s, %s, %s, %s)'
    val = [(1, 1, 'mysql 모델링 하는 법', 25000, 'IT001'), (2, 2, '개미', 13000, 'NV001'), (3, 3, '공상과학', 9000, 'SF001')]
    cursor.executemany(sql, val)
    bookmall.commit()
    cursor.close()
    bookmall.close()

except:
    print(end='')

def select_model_book():
    bookmall = connetion()
    cursor = bookmall.cursor(DictCursor)
    sql = "select book_name, price from book order by no desc"
    cursor.execute(sql)
    results = cursor.fetchall();
    cursor.close()
    bookmall.close()
    return results

def select_model_book_order():
    bookmall = connetion()
    cursor = bookmall.cursor(DictCursor)
    sql = "select a.book_number, a.book_name, b.book_count from book a, cart b where a.no = b.no"
    cursor.execute(sql)
    results = cursor.fetchall();
    cursor.close()
    bookmall.close()
    return results

