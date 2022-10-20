# 카트리스트 2개 도서제목, 수량, 가격
# from models import model_member, model_catagory, model_book, 카트리스트 ,model_orders, model_order_book
from models import model_member, model_catagory, model_book, model_orders, model_order_book

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
        print(f"[주문 리스트] 주문번호: {result['order_number']} 주문자: {result['member_name']} 결제금액: {result['price_amount']}원 배송지: {result['address']}")

def run_order_book():
    results = model_order_book.select_model_order_book()
    for index, result in enumerate(results):
        print(f"[주문 도서 리스트] 도서번호: {result['book_number']} 도서제목: {result['book_name']} 수량:{result['book_count']}")

def main():
    print("-- 회원 리스트 --")
    run_member()
    # 회원 리스트 2개
    print("\n-- 카테고리 리스트 --")
    run_catagory()
    # 카 3
    print("\n-- 상품 리스트 --")
    run_book()
    # 상 3

    print("\n-- 카트 리스트 --")
    # 카트리스트 2개

    print("\n-- 주문 리스트 --")
    run_orders()
    # 주문 리스트 1개

    print("\n-- 주문 도서 리스트 --")
    run_order_book()
    # 주문 리스트 2개

if __name__ == '__main__':
    main()