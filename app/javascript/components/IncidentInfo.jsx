import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class IncidentInfo extends Component {
    constructor() {
        super();
        this.state = { incident: {} };
        this.handleDelete = this.handleDelete.bind(this);
    }

    componentDidMount() {
        fetch(`api/v1/incidents/${this.props.match.params.id}`)
            .then(response => response.json())
            .then(data => {
                this.setState({incident: data});
            })
            .catch(error => console.log('error', error));
    }

    handleDelete() {
        fetch(`api/v1/incidents/${this.props.match.params.id}`, {method: 'DELETE'})
            .then(() => {
                this.props.history.push("/incidents")
            })
            .catch(error => console.log('error', error));
    }

    render() {
        return (
            <div>
                <h2>{this.state.incident.id}: {this.state.incident.title}</h2>
                <p>{this.state.incident.content}</p>
                <p>
                    <Link to={`/incidents/${this.state.incident.id}/edit`} className="btn btn-outline-dark">Edit</Link>
                    <button onClick={this.handleDelete} className="btn btn-outline-dark">Delete</button>
                    <Link to="/incidents" className="btn btn-outline-dark">Close</Link>
                </p>
                <hr/>
            </div>
        )
    }
}

export default IncidentInfo;