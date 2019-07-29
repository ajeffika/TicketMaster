import React, { Component } from 'react';
import IncidentList from './IncidentList';
import IncidentInfo from './IncidentInfo';
import IncidentAdd from './IncidentAdd';
import IncidentEdit from './IncidentEdit';
import Home from './Home';
import {HashRouter as Router, Route, NavLink, Switch} from 'react-router-dom'

class App extends Component {
    render() {
        return (
            <div className="App">
                <Router>
                    <Navigation />
                    <div className="container">
                        <Main />
                    </div>
                </Router>
            </div>
        );
    }
}


const Navigation = () => (
    <nav className="navbar-stretch navbar navbar-expand-lg navbar-dark bg-dark">
        <ul className="navbar-nav mr-auto">
            <li className="nav-item"><NavLink exact className="nav-link" activeClassName="active" to="/">Home</NavLink></li>
            <li className="nav-item"><NavLink exact className="nav-link" activeClassName="active" to="/incidents">Incidents</NavLink></li>
        </ul>
    </nav>

);

const Main = () => (
    <Switch>
        <Route exact path="/" component={Home} />
        <Route exact path="/incidents" component={IncidentList} />
        <Route exact path="/incidents/new" component={IncidentAdd} />
        <Route exact path="/incidents/:id" component={IncidentInfo} />
        <Route exact path="/incidents/:id/edit" component={IncidentEdit} />
    </Switch>
);

export default App;