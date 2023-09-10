import React from "react";
import Test from "components/Test";

import { getServerSession } from "next-auth/next";
import { options } from "/app/api/auth/[...nextauth]/options";

async function page() {
  const session = await getServerSession(options);
  return <h1> {JSON.stringify(session)}</h1>;
}

export default page;
