import React, { Component } from 'react';

class IncidentAdd extends Component {
    constructor() {
        super();
        this.state = { title: '', content: ''};
        this.handleChange = this.handleChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleCancel = this.handleCancel.bind(this);
    }

    handleSubmit(event) {
        event.preventDefault();
        fetch('api/v1/incidents', {
            method: 'POST',
            body: JSON.stringify(this.state),
            headers: {'Content-Type': 'application/json' }
        })
            .then(response => response.json())
            .then(data => {
                this.props.history.push(`/incidents/${data.id}`);
            })
            .catch(error => console.log('error', error));
    }

    handleChange(event) {
        this.setState({ [event.target.name]: event.target.value });
    }

    handleCancel() {
        this.props.history.push("/incidents");
    }

    render() {
        return (
            <div>
                <h1>Create Incident</h1>
                <form onSubmit={this.handleSubmit}>
                    <div className="form-group">
                        <label>Title</label>
                        <input type="text" name="title" value={this.state.title} onChange={this.handleChange} className="form-control" />
                    </div>
                    <div className="form-group">
                        <label>Description</label>
                        <textarea name="content" rows="5" value={this.state.description} onChange={this.handleChange} className="form-control" />
                    </div>
                    <div className="form-group">
                        <label>Content</label>
                        <textarea name="content" rows="5" value={this.state.contractor} onChange={this.handleChange} className="form-control" />
                    </div>
                    <div className="form-group">
                        <label>Content</label>
                        <textarea name="content" rows="5" value={this.state.sla} onChange={this.handleChange} className="form-control" />
                    </div>
                    <div className="form-group">
                        <label>Content</label>
                        <textarea name="content" rows="5" value={this.state.attachment} onChange={this.handleChange} className="form-control" />
                    </div>
                    <div className="btn-group">
                        <button type="submit" className="btn btn-dark">Create</button>
                        <button type="button" onClick={this.handleCancel} className="btn btn-secondary">Cancel</button>
                    </div>
                </form>
            </div>
        );
    }
}

export default IncidentAdd;