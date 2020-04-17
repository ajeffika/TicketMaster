import axios from 'axios';

let token = document.getElementsByName('csrf-token')[0].getAttribute('content');

const index = axios.create({
  headers: {
    'X-CSRF-TOKEN': token
  },
});

export default index;
