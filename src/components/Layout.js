import Header from './Header';
import Navbar from './Navnar';
import Footer from './Footer';

function Layout({children}) {
    return ( 
        <>
            <Header/>
            <Navbar/>
            <main className='max-w-screen-xl ml-auto mr-auto'>
                {children}
            </main>
            <Footer/>      
        </>
     );
}

export default Layout;