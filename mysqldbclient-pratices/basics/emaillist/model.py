from MySQLdb import connect
from MySQLdb.cursors import DictCursor


def findall():
    db = connect(user='webdb', password='webdb', host='127.0.0.1', port=3306, db='webdb', charset='utf8')
    cursor = db.cursor(DictCursor)
    sql = "select first_name, last_name, email from email_list order by no desc"
    count = cursor.execute(sql)
    if count == 0:
        print("이메일 리스트에 값이 없습니다.")
    results = cursor.fetchall();
    cursor.close()
    db.close()
    return results

def insert(first_name, last_name, email):
    db = connect(user='webdb', password='webdb',host= '127.0.0.1', port=3306, db='webdb', charset = 'utf8')
    cursor = db.cursor()
    sql = f"insert into email_list values(null, '{first_name}', '{last_name}', '{email}')"
    count = cursor.execute(sql)
    db.commit()
    cursor.close()
    db.close()
    return count == 1

def delete():
    db = connect(user='webdb', password='webdb',host= '127.0.0.1', port=3306, db='webdb', charset = 'utf8')
    cursor = db.cursor()
    email = input("지우려는 사람의 이메일을 입력해주세요. ")
    sql = f"delete from email_list where email = '{email}'"
    count = cursor.execute(sql)
    db.commit()
    cursor.close()
    db.close()
