import React, { Component } from 'react'
import { post } from 'axios';

class Login extends Component {
    constructor() {
        super()
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleSubmit (event) {
        event.preventDefault();
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        const request = {"email": email, "password": password};
        post('/auth/sign_in', request)
            .then(response => {
                localStorage.setItem("access-token", response.headers['access-token']);
                localStorage.setItem("uid", response.headers.uid);
                localStorage.setItem("client", response.headers.client);
                this.props.history.push("/");
            })
            .catch(error => console.log('error', error));
    }

    render() {
        return (
            <div>
                <h1>Log In</h1>
                <form onSubmit={this.handleSubmit}>
                    <div className="form-group">
                        <label htmlFor="email">Email: </label>
                        <input name="email" id="email" type="email" className="form-control" />
                    </div>
                    <div className="form-group">
                        <label htmlFor="password">Password:</label>
                        <input name="password" id="password" type="password" className="form-control" />
                    </div>
                    <button type="submit" className="btn btn-dark">Submit</button>
                </form>
            </div>
        );
    }
}

export default Login;