# 회원리스트 2명
# 카테고리리스트 3개
# 상품리스트 3개
# 주문 리스트 1개
# 주문 도서 리스트 2개

def Main():
    print("회원 리스트")
    run_model_member()

    print("카테고리 리스트")
    run_model_catagory()

    print("상품 리스트")
    run_model_book()

    print("주문 리스트")
    run_model_orders()

    print("주문 도서 리스트")
    run_model_order_book()