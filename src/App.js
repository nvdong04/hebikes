import logo from './assets/images/logo.png';
import './App.css';
import Header from './components/Header';
import Navbar from './components/Navnar';
import Footer from './components/Footer';

function App() {
  return (
    <div className='app'>
      <Header/>
      <Navbar/>
      <Footer/>
    </div>
  );
}

export default App;
