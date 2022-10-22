from models import model_member, model_catagory, model_book, model_orders, model_cart

def run_member():
    results = model_member.select_model_member()
    for index, result in enumerate(results):
        print(f"[회원 {index + 1}] 이름: {result['member_name']} 전화번호: {result['phone_number']} 이메일: {result['member_mail']} 비밀번호: {result['member_password']}")


def run_catagory():
    results = model_catagory.select_model_catagory()
    for index, result in enumerate(results):
        print(f"[카테고리 종류] {result['catagory_name']}")

def run_book():
    results = model_book.select_model_book()
    for index, result in enumerate(results):
        print(f"[책 종류] 이름: {result['book_name']} 가격: {result['price']}원")

def run_orders():
    results = model_orders.select_model_orders()
    for index, result in enumerate(results):
        print(f"[주문 리스트] 주문번호: {result['order_number']} 주문자: {result['member_name']} 결제금액: {result['price']}원 배송지: {result['address']}")

def run_cart():
    results = model_cart.select_model_cart()
    for index, result in enumerate(results):
        print(f"[주문 리스트] 도서제목: {result['book_name']} 수량: {result['book_count']}권 가격: {result['price']}원")

def run_order_book():
    results = model_book.select_model_book_order()
    for index, result in enumerate(results):
        print(f"[주문 도서 리스트] 도서제목: {result['book_number']} 도서제목: {result['book_name']} 수량: {result['book_count']}권")

def main():
    print("-- 회원 리스트 --")
    run_member()

    print("\n-- 카테고리 리스트 --")
    run_catagory()

    print("\n-- 상품 리스트 --")
    run_book()

    print("\n-- 카트 리스트 --")
    run_cart()

    print("\n-- 주문 리스트 --")
    run_orders()

    print("\n-- 주문 도서 리스트 --")
    run_order_book()

if __name__ == '__main__':
    main()