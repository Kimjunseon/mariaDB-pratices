from MySQLdb import connect
from MySQLdb.cursors import DictCursor


def findall():
    db = conn()
    cursor = db.cursor(DictCursor)
    sql = "select first_name, last_name, email from email_list order by no desc"
    cursor.execute(sql)
    results = cursor.fetchall();
    cursor.close()
    db.close()
    return results

def insert(first_name, last_name, email):
    db = conn()
    cursor = db.cursor()
    sql = "insert into email_list values(null, %s, %s, %s)"
    count = cursor.execute(sql, (first_name, last_name, email))

    db.commit()
    cursor.close()
    db.close()
    return count == 1

def delete(email):
    db = conn()
    cursor = db.cursor()

    sql = f"delete from email_list where email = %s"
    count = cursor.execute(sql, (email,))

    db.commit()
    cursor.close()
    db.close()

def conn():
    db = connect(user='webdb', password='webdb', host='127.0.0.1', port=3306, db='webdb', charset='utf8')
    return db