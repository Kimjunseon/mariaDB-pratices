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
    sql = 'insert into member (no, member_name, phone_number, member_mail, member_password, address) values(%s, %s, %s, %s, %s, %s)'
    val = [(1, "김준선", "010-8888-8888", "js@naver.com", "jsjs88", "강원도 원주"), (2, "김세모", "010-5555-5555", "semo@gmail.com", "semo55", "서울시 서초")]
    cursor.executemany(sql, val)
    bookmall.commit()
    cursor.close()
    bookmall.close()

except:
    print(end='')



def select_model_member():
    bookmall = connetion()

    cursor = bookmall.cursor(DictCursor)
    sql = "select member_name, phone_number, member_mail, member_password from member order by no desc"
    cursor.execute(sql)
    results = cursor.fetchall();
    cursor.close()

    bookmall.close()

    return results
