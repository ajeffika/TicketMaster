import axios from 'axios'

let token = document.getElementsByName('csrf-token')[0].getAttribute('content')

const index = axios.create({
  baseURL: '/api/v1',
  headers: {
    'Accept': 'application/json',
    'X-CSRF-TOKEN': token
  }
})

export default index
