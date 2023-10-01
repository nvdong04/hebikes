function Footer() {
  return (
    <footer className="w-screen bg-indigo-700">
      <div class="max-w-screen-xl ml-auto mr-auto pt-11 pb-8">
        <div class="grid grid-cols-4 gap-4">
          <div class="col-lg-3 col-md-6 col-12">
            <h4 class="uppercase text-white font-bold m-0 p-0">
              <span>
                Về chúng tôi{" "}
                <i class="fa fa-plus hidden" aria-hidden="true"></i>
              </span>
            </h4>
            <ul class="pt-6">
              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/" title="Trang chủ">
                  Trang chủ
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/gioi-thieu" title="Giới thiệu">
                  Giới thiệu
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/" title="Sản phẩm">
                  Sản phẩm
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/mua-tra-gop" title="Mua trả góp">
                  Mua trả góp
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/tin-moi-nhat" title="Tin mới nhất">
                  Tin mới nhất
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/cau-hoi-thuong-gap" title="Câu hỏi thường gặp">
                  Câu hỏi thường gặp
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/lien-he" title="Liên hệ">
                  Liên hệ
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a
                  href="/thong-tin-dang-ky-bao-hanh"
                  title="Thông tin đăng ký bảo hành"
                >
                  Thông tin đăng ký bảo hành
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/trang-thong-tin" title="Trang thông tin">
                  Trang thông tin
                </a>
              </li>
            </ul>
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <h4 class="uppercase text-white font-bold m-0 p-0">
              <span>
                Hướng dẫn <i class="fa fa-plus hidden" aria-hidden="true"></i>
              </span>
            </h4>
            <ul class="pt-6">
              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/huong-dan" title="Hướng dẫn mua hàng">
                  Hướng dẫn mua hàng
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/huong-dan" title="Giao nhận và thanh toán">
                  Giao nhận và thanh toán
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/huong-dan" title="Đổi trả và bảo hành">
                  Đổi trả và bảo hành
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/account/register" title="Đăng ký thành viên">
                  Đăng ký thành viên
                </a>
              </li>
            </ul>
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <h4 class="uppercase text-white font-bold m-0 p-0">
              <span>
                Điều khoán <i class="fa fa-plus hidden" aria-hidden="true"></i>
              </span>
            </h4>
            <ul class="pt-6">
              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/dieu-khoan" title="Điều khoản sử dụng">
                  Điều khoản sử dụng
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/" title="Điều khoản giao dịch">
                  Điều khoản giao dịch
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/" title="Dịch vụ tiện ích">
                  Dịch vụ tiện ích
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/" title="Quyền sở hữu trí tuệ">
                  Quyền sở hữu trí tuệ
                </a>
              </li>
            </ul>
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <h4 class="uppercase text-white font-bold m-0 p-0">
              <span>
                Chính sách <i class="fa fa-plus hidden" aria-hidden="true"></i>
              </span>
            </h4>
            <ul class="pt-6">
              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/chinh-sach" title="Chính sách thanh toán">
                  Chính sách thanh toán
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/chinh-sach" title="Chính sách vận chuyển">
                  Chính sách vận chuyển
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/chinh-sach" title="Chính sách đổi trả">
                  Chính sách đổi trả
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/chinh-sach" title="Chính sách bảo hành">
                  Chính sách bảo hành
                </a>
              </li>

              <li class="text-slate-300 hover:text-yellow-700">
                <a href="/chinh-sach" title="Chính sách bảo mật thông tin">
                  Chính sách bảo mật thông tin
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>
  );
}

export default Footer;
