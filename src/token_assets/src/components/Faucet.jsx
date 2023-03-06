import React, { useState } from "react";
import { canisterId, createActor} from '../../../declarations/token';
import { AuthClient } from '@dfinity/auth-client';

function Faucet(props) {

  const[isDisabled, setDisabled] = useState(false);
  const[buttontext, setText] = useState("Gimme gimme")

  async function handleClick(event) {
    setDisabled(true);

    const authClient = await AuthClient.create();
    const identity = await authClient.getIdentity();

    const authenticatedCanister = createActor(canisterId, {
      agentOptions:{
        identity,
      },
    });

    const results = await authenticatedCanister.payOut();
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
      <label>Get your free DAM tokens here! Claim 10,000 DAM coins to your {props.userPrincipal}.</label>
      <p className="trade-buttons">
        <button id="btn-payout" onClick={handleClick} disabled={isDisabled} >
          {buttontext}
        </button>
      </p>
    </div>
  );
}

export default Faucet;
