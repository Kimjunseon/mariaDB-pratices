from MySQLdb import connect
from MySQLdb import OperationalError
from MySQLdb.cursors import DictCursor

try:
# 1. 연결
    db = connect(user='webdb', password='webdb',host= '127.0.0.1', port=3306, db='webdb', charset = 'utf8')
    print("success")

    # 2. dict 커서 생성
    cursor = db.cursor(DictCursor)

    # 3. sql delete문 실행
    sql = "select name, owner, species, gender, date_format(birth, '%y-%m-%d') as birth from pet"
    count = cursor.execute(sql)

    # 4. 결과 받아오기
    results = cursor.fetchall();

    # 5. 자원정리
    cursor.close()
    db.close()

    # 6. 결과보기
    for result in results:
        print(result)

    # 결과 확인
    print(f'실행결과: {count}')
    # 결과확인
    # print(f'실행결과: {"성공" if count == 1 else "실패"}')

except OperationalError as e:
    # 에러처리
    print(f'에러: {e}')

print("end")

# cursor
# cursor = db.cursor()
