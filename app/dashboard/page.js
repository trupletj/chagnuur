"use client";
import React from "react";
import Skeleton from "components/Skeleton";

function Dashboard() {
  return (
    <div className="flex-col flex space-y-4">
      <Skeleton />
      <Skeleton />
    </div>
  );
}

export default Dashboard;
