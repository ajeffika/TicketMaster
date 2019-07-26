import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class IncidentList extends Component {
    constructor() {
        super();
        this.state = { incidents: [] };
    }

    componentDidMount() {
        fetch('api/v1/incidents')
            .then(response => response.json())
            .then(data => {
                this.setState({incidents: data});
            })
            .catch(error => console.log('error', error));
    }
    render() {
        return (
            <div>
                {this.state.incidents.map((incident) => {
                    return(
                        <div className="incident-container">
                            <div key={incident.id}>
                                <h2><Link to={`/incidents/${incident.id}`}>{incident.title} desc: {incident.description}</Link></h2>

                                <hr/>
                            </div>
                        </div>

                    )
                })}
                <Link to="/incidents/new" className="btn btn-outline-primary">Create Incident</Link>
            </div>
        );
    }
}

export default IncidentList;
