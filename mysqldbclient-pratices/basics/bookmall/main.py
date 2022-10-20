# 회원리스트 2명 이름, 전화번호, 이메일, 비밀번호
# 카테고리리스트 3개 ex) 소설 수필 IT
# 상품리스트 3개 제목, 가격
# 카트리스트 2개 도서제목, 수량, 가격
# 주문 리스트 1개 주문번호 주문자 결제금액 배송지
# 주문 도서 리스트 2개 도서번호 도서제목 수량
# from models import model_member, model_catagory, model_book, 카트리스트 ,model_orders, model_order_book
from models import model_member, model_catagory

def run_member():
    results = model_member.select_model_member()
    for index, result in enumerate(results):
        print(f"[회원 {index + 1}] 이름: {result['member_name']} 전화번호: {result['phone_number']} 이메일: {result['member_mail']} 비밀번호: {result['member_password']}")

def run_catagory():
    results = model_catagory.select_model_catagory()
    for index, result in enumerate(results):
        print(f"[회원 {index + 1}] 이름: {result['member_name']} 전화번호: {result['phone_number']} 이메일: {result['member_mail']} 비밀번호: {result['member_password']}")



def main():
    print("-- 회원리스트 --")
    run_member()

    print("카테고리 리스트")
    run_catagory()
    #
    # print("상품 리스트")
    # run_book()
    #
    # print("주문 리스트")
    # run_orders()
    #
    # print("주문 도서 리스트")
    # run_order_book()

if __name__ == '__main__':
    main()