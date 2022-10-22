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
    sql = 'insert into catagory(no, catagory_name) values(%s, %s)'
    val = [(1, 'IT'), (2, 'NOVEL'), (3, 'SF')]
    cursor.executemany(sql, val)
    bookmall.commit()
    cursor.close()
    bookmall.close()

except:
    print(end='')

def select_model_catagory():
    bookmall = connetion()
    cursor = bookmall.cursor(DictCursor)
    sql = "select catagory_name from catagory order by no desc"
    cursor.execute(sql)
    results = cursor.fetchall();
    cursor.close()
    bookmall.close()
    return results
