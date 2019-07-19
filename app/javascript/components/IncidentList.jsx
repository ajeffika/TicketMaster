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
                        <div key={incident.id}>
                            <h2><Link to={`/incidents/${incident.id}`}>{incident.title}</Link></h2>
                            {incident.content}
                            <hr/>
                        </div>
                    )
                })}
                <Link to="/incidents/new" className="btn btn-outline-primary">Create Incident</Link>
            </div>
        );
    }
}

export default IncidentList;
