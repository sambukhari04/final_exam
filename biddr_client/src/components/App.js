import React, { Component } from 'react';

import {
   BrowserRouter as Router,
   Route,
   Switch,
   Link
 } from 'react-router-dom';
//Pages

import AuctionsIndexPage from './AuctionsIndexPage';
import AuctionsShowPage from './AuctionsShowPage';


class App extends Component {
  render() {
    return (
      <Router>
         <div className="App">
           <nav>
             <h3>Biddr</h3>
             <Link to="/">Home</Link>
             <Link to="/auctions">Auctions</Link>
           </nav>

           <Switch>
             <Route path="/auctions/:id" component={AuctionsShowPage} />
             <Route path="/auctions" component={AuctionsIndexPage} />
           </Switch>
         </div>
       </Router>
    );
  }
}

export default App;
