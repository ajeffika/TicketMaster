import React from 'react';
import { Redirect } from 'react-router-dom'

const Logout = () => {
    localStorage.removeItem('access-token');
    localStorage.removeItem('uid');
    localStorage.removeItem('client');
    return <Redirect to='/' />
}

export default Logout;