import Layout from "./Layout";

function Info() {
    return (
        <Layout>
            <section>
                <div class="px-2.5 leading-10">
                    <div class="pt-4 mb-8">
                        <div>
                            <div>
                                <div>
                                    <h1 class="text-xl font-bold uppercase mb-4 border-b-2 border-b-red-600 pb-5">Giới thiệu</h1>
                                </div>
                                <div class="min-h-[400px] mb-8 rte">
                                    <h3><span className="text-base"><b>1. Địa chỉ Xe Lan Anh - Lan Anh Motor:</b></span></h3>
                                    <p>Số 145 - Phố Bạch Mai - Quận Hai Bà Trưng - Hà Nội</p>
                                    <h3><strong><span className="text-base">2. Số điện thoại liên hệ:</span></strong></h3>
                                    <p>02439716136 - 02421468999</p>
                                    <h3><strong><span className="text-base">3. Sản phẩm và dịch vụ cung cấp:</span></strong></h3>
                                    <p>- Xe ga 50cc</p>
                                    <p>- Xe máy 50cc</p>
                                    <p>- Ô tô điện</p>
                                    <p>- Xe máy điện</p>
                                    <p>- Xe đạp điện</p>
                                    <p>- Ắc quy xe điện</p>
                                    <p>- Sạc xe điện, phụ tùng xe điện và xe máy 50cc</p>
                                    <p>- Dịch vụ sửa chữa, bảo dưỡng, thay dầu xe máy và xe điện</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </Layout>
    );
}

export default Info;