import logo from '../assets/images/logo.png';
function Header () {
    return (
        <header className='max-w-screen-xl ml-auto mr-auto'>
            <div class='flex justify-between items-center content-center'>
                <div>
                    <img width={120} src={logo} alt='XE ĐẸP'></img>
                </div>
                <div className='flex items-center content-center'>
                    <div className='mr-12'>
                        <p>Tư vấn hỗ trợ</p>
                        <p className='text-lg text-orange-600 font-bold'>0988999777</p>
                    </div>
                    <div class='flex items-center content-center mr-8'>
                        <i class="fa-solid fa-user text-4xl text-neutral-500"></i>
                        <div className='ml-2 text-center'>
                            <p>Xin chào</p>
                            <a href='.' className='text-orange-600 font-bold'>Đăng Nhập</a>
                        </div>
                    </div>
                    <div className=''>
                        <i class="fa-solid fa-cart-shopping text-4xl text-neutral-500"></i>
                    </div>
                </div>
            </div>
        </header>
    )
}

export default Header; 