import Layout from "./Layout";

function Contact() {
  return (
    <Layout>
      <div class="pb-8">
        <div class="container">
          <div class="">
            <h1 className="text-xl font-bold uppercase mb-4 border-b-2 border-b-red-600 pb-5">
              Liên hệ
            </h1>
          </div>
          <div class="row">
          <div class="col-12 order-1 order-lg-1">
              <div class="wrapcontact">
                <div class="mb-5">
                  <div id="contact_map" class="map">
                    <iframe
                      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.6678112216796!2d105.84914031424495!3d21.005948993934116!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ad3e02debc13%3A0x18aa4b704048704e!2zWEUgxJBJ4buGTiwgWEUgTcOBWSA1MENDIExBTiBBTkg!5e0!3m2!1sen!2s!4v1652417014314!5m2!1sen!2s"
                      width="600"
                      height="450"
                      className="border-none w-full h-[450px]"
                      allowfullscreen=""
                      loading="lazy"
                      referrerpolicy="no-referrer-when-downgrade"
                    ></iframe>
                  </div>
                </div>
              </div>
            </div>
            <div class="">
              <div class="grid grid-cols-3 gap-4">
                <div class="">
                  <div class="flex mb-2.5 p-2.5 rounded-lg bg-[#f7f7f7]">
                    <div class="w-10 h-10 leading-10 rounded-3xl bg-red-600 text-white text-center">
                      <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <div class="pl-3.5 font-bold">
                      Địa chỉ:
                      <p className="font-normal">CS1: 145 Bạch Mai quận Hai Bà Trưng, HN</p>
                    </div>
                  </div>
                  <div class="flex mb-2.5 p-2.5 rounded-lg bg-[#f7f7f7]">
                    <div class="w-10 h-10 leading-10 rounded-3xl bg-red-600 text-white text-center">
                      <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <div class="pl-3.5 font-bold">
                      Địa chỉ:
                      <p className="font-normal">CS2: 444 Khương Đình, quận Thanh Xuân, HN</p>
                    </div>
                  </div>
                  <div class="flex mb-2.5 p-2.5 rounded-lg bg-[#f7f7f7]">
                    <div class="w-10 h-10 leading-10 rounded-3xl bg-red-600 text-white text-center">
                      <i class="fas fa-question"></i>
                    </div>
                    <div class="pl-3.5 font-bold">
                      Gửi thắc mắc:
                      <a className="font-normal" href="mailto:xedapdienlananh@gmail.com">
                        xedapdienlananh@gmail.com
                      </a>
                    </div>
                  </div>
                  <div class="flex mb-2.5 p-2.5 rounded-lg bg-[#f7f7f7]">
                    <div class="w-10 h-10 leading-10 rounded-3xl bg-red-600 text-white text-center">
                      <i class="fas fa-phone-alt"></i>
                    </div>
                    <div class="pl-3.5 font-bold">
                      Điện thoại:
                      <a className="font-normal" href="tel:0985571111">
                        0985571111
                      </a>
                    </div>
                  </div>
                </div>
                <div class="col-span-2">
                  <div id="pagelogin">
                    <form
                      method="post"
                      action="/postcontact"
                      id="contact"
                      accept-charset="UTF-8"
                    >
                      <input name="FormType" type="hidden" value="contact" />
                      <input name="utf8" type="hidden" value="true" />
                      <input
                        type="hidden"
                        id="Token-c144e669be364fc385db17157d62d874"
                        name="Token"
                      />
                      <div class="form-signup clearfix">
                        <div class="mx-2.5 grid grid-cols-2">
                          <fieldset class="px-2.5 mb-2.5">
                            <label className="mb-1.5 font-bold">
                              Họ và tên <em className="text-red-700">*</em>
                            </label>
                            <input
                              placeholder=""
                              type="text"
                              class="mt-1.5 rounded-none h-10 px-4 border-l-2 border-l-red-600 bg-[#f7f7f7] border-[#f7f7f7] block w-full min-h-[40px] focus:outline-none"
                              required=""
                              value=""
                              name="contact[Name]"
                            />
                          </fieldset>

                          <fieldset class="px-2.5 mb-2.5">
                            <label className="mb-1.5 font-bold">
                              Email <em className="text-red-700">*</em>
                            </label>
                            <input
                              placeholder=""
                              type="email"
                              pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
                              required=""
                              id="email1"
                              class="mt-1.5 rounded-none h-10 px-4 border-l-2 border-l-red-600 bg-[#f7f7f7] border-[#f7f7f7] block w-full min-h-[40px] focus:outline-none"
                              value=""
                              name="contact[email]"
                            />
                          </fieldset>

                          <fieldset class="px-2.5 mb-2.5 col-span-12">
                            <label className="mb-1.5 font-bold">
                              Nội dung <em className="text-red-700">*</em>
                            </label>
                            <textarea
                              placeholder=""
                              name="contact[body]"
                              id="comment"
                              class="mt-1.5 rounded-none h-10 px-4 border-l-2 border-l-red-600 bg-[#f7f7f7] border-[#f7f7f7] block w-full min-h-[100px] focus:outline-none resize-none"
                              rows="5"
                              required=""
                            ></textarea>
                          </fieldset>
                          <div class="col-span-12 px-2.5">
                            <button type="submit" class="btn">
                              Gửi liên hệ
                            </button>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </Layout>
  );
}

export default Contact;
