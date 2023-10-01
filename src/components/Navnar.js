function Navbar() {
    return (
        <nav className='w-screen bg-orange-600 h-10'>
            <div className='max-w-screen-xl ml-auto mr-auto'>
                <div className="flex items-center content-center justify-center h-10 space-x-14 text-white font-bold">
                    <div className="hover:text-yellow-400">
                        <a href="/">Trang chủ</a>
                    </div>
                    <div className="hover:text-yellow-400">
                        <a href="/">Sản phẩm</a>
                    </div>
                    <div className="hover:text-yellow-400">
                        <a href="/">Giới thiệu</a>
                    </div>
                    <div className="hover:text-yellow-400">
                        <a href="/">Liên hệ</a>
                    </div>
                    <div className="hover:text-yellow-400">
                        <a href="/">Câu hỏi thường gặp</a>
                    </div>
                </div>
            </div>
        </nav>
    )
}

export default Navbar;