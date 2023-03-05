import React, { useState } from "react";
import {token} from '../../../declarations/token';

function Faucet() {

  const[isDisabled, setDisabled] = useState(false);
  const[buttontext, setText] = useState("Gimme gimme")

  async function handleClick(event) {
    setDisabled(true);
    const results = await token.payOut();
    setText(results);
    // setDisabled(false);
  }

  return (
    <div className="blue window">
      <h2>
        <span role="img" aria-label="tap emoji">
          🚰
        </span>
        Faucet
      </h2>
      <label>Get your free DAM tokens here! Claim 10,000 DAM coins to your account.</label>
      <p className="trade-buttons">
        <button id="btn-payout" onClick={handleClick} disabled={isDisabled} >
          {buttontext}
        </button>
      </p>
    </div>
  );
}

export default Faucet;
