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
                                <Link to={`/incidents/${incident.id}`}><h2>{incident.title} </h2></Link>
                                Contractor:  {incident.contractor.contractor_name}<br/>
                                Group:  {incident.group.name}
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
