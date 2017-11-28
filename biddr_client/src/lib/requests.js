const BASE_URL = 'http://localhost:3000';
const API_KEY = 'cnWO5j3_sHu3e9V-sR2NqJCdjMJxem2HQrX4I4GhkjSM-FuzCzbx3jjvQ801LYw74nbRj1Hmndz9yjU-XTd-tQ'

export const Auction = {
 getAll () {

   return fetch(
     `${BASE_URL}/api/v1/auctions`,
     {
       headers: {api_key: API_KEY}
     }
   ).then(res => res.json());
 },

  get (id) {
    return fetch(
    `${BASE_URL}/api/v1/auctions/${id}`,
       {
         headers: {api_key: API_KEY}
       }
    ).then(res => res.json());
  }
}
