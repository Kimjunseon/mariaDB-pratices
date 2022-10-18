import model

def run_list():
    results = model.findall()
    for index, result in enumerate(results):
        print(f"{index + 1}: {result['first_name']}{result['last_name']}:{result['email']}")

def run_add():
    first_name = input("성을 입력하세요. ")
    last_name = input("이름을 입력하세요. ")
    email = input("이메일을 입력하세요. ")
    model.insert(first_name, last_name, email)
    run_list()

def run_delete():
    email = input("email: ")
    model.delete(email)
    run_list()


def main():
    while True:
        cmd = input('(l)ist, (a)dd, (d)elete, (q)uit > ')

        if cmd == 'q':
            print("종료")
            break
        elif cmd == 'l':
            run_list()

        elif cmd == 'a':
            run_add()

        elif cmd == 'd':
            run_delete()
        else:
            print("알 수 없는 입력입니다.")
            print("l, q, a, d 값 중 1개만 입력해주세요.")

if __name__ == '__main__':
    main()