import React, { Component } from 'react';
import  axios  from 'axios';
import { Link } from 'react-router-dom';

class IncidentList extends Component {
    constructor() {
        super();
        this.state = { incidents: [] };
    }

    componentDidMount() {
        let token = ["access-token " + localStorage.getItem("access-token"), "uid " + localStorage.getItem('uid'), "client " + localStorage.getItem('client')];
        console.log('kek', token)
        axios({method: 'get', url: '/api/v1/incidents', headers: {'Authorization' : token }})
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
