import React from 'react';

 function AuctionDetails (props) {
   const {
     title, details, end_date, price, user = {}, created_at, bids = []
   } = props;

   console.log(props)

   return (
     <div className="AuctionDetails">
       <h2>{title}</h2>
       <p>{details}</p>
       <p>{end_date}</p>
       <p>{price}</p>
       <p><em>By {user.first_name} {user.last_name}</em></p>
       <p><strong>Created at:</strong> {created_at}</p>
       <h3>Bids</h3>
       <ul className="BidsList">
         {
           bids.map(bid => <li key={bid.id}>{bid.price}</li>)
         }
       </ul>
     </div>
   );
 }

 export default AuctionDetails;
