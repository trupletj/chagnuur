"use client";
import React from "react";
import useSWR from "swr";

const fetcher = (...args) => fetch(...args).then((res) => res.json());
function Test() {
  const { data, error, isLoading } = useSWR(
    "http://localhost:3000/api/courses",
    fetcher
  );
  if (error) return <div> "An error has occurred."</div>;
  if (isLoading) return <div>loading</div>;
  return <div>Test {JSON.stringify(data)}</div>;
}

export default Test;
