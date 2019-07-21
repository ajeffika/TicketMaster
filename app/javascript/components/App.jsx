import React, { Component } from 'react';
import IncidentList from './IncidentList';
import {HashRouter as Router, Route, NavLink, Switch} from 'react-router-dom'

class App extends Component {
    render() {
        return (
            <div className="App">
                <Router>
                    <div className="container">
                        <Navigation />
                        <Main />
                    </div>
                </Router>
            </div>
        );
    }
}

const Navigation = () => (
    <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
        <ul className="navbar-nav mr-auto">
            <li className="nav-item"><NavLink exact className="nav-link" activeClassName="active" to="/">Home</NavLink></li>
            <li className="nav-item"><NavLink exact className="nav-link" activeClassName="active" to="/incidents">Articles</NavLink></li>
        </ul>
    </nav>
);

const Main = () => (
    <Switch>
        <Route exact path="/" component={Home} />
        <Route exact path="/articles" component={IncidentList} />
        {/*<Route exact path="/articles/new" component={ArticleAdd} />*/}
        {/*<Route exact path="/articles/:id" component={ArticleInfo} />*/}
        {/*<Route exact path="/articles/:id/edit" component={ArticleEdit} />*/}
    </Switch>
);

export default App;