"use client";

import React, { use, useRef, useState, useEffect } from "react";
import Link from "next/link";
import { csrfToken } from "next-auth/react";
import { signIn } from "next-auth/react";
import { useSearchParams } from "next/navigation";

function SignIn() {
  const [error, setError] = useState(null);
  const emailRef = useRef(null);
  const passwordRef = useRef(null);
  const searchParams = useSearchParams();
  const searchError = searchParams.get("error");
  const callbackUrl = searchParams.get("callbackUrl");

  function ValidateEmail(mail) {
    if (/^[a-zA-Z0-9]+@(?:[a-zA-Z0-9]+\.)+[A-Za-z]+$/.test(mail)) {
      return true;
    }
    return false;
  }

  useEffect(() => {
    if (searchError) {
      setError("Нэвтрэх нэр эсвэл нууц үг буруу байна. Дахин оролдоно уу");
    }
  }, [searchError]);
  const onSubmit = async (e) => {
    setError(null);
    if (!emailRef.current || !passwordRef.current) {
      setError("Бүх талбарыг бөглөнө үү");
      return;
    } else if (!ValidateEmail(emailRef.current)) {
      setError("Имэйл хаяг буруу байна");
      return;
    } else {
      e.preventDefault();
      const result = await signIn("credentials", {
        email: emailRef.current,
        password: passwordRef.current,
        callbackUrl: callbackUrl || `/dashboard`,
      });
    }
  };
  return (
    <div className="w-full max-w-[600px] mx-auto rounded-xl  overflow-hidden p-10 h-full">
      <h1 className="text-4xl font-bold text-center">Нэвтрэх</h1>
      <form
        className="space-y-4"
        method="post"
        action="/api/auth/callback/credentials"
      >
        <div className="flex flex-col space-y-2">
          <input name="csrfToken" type="hidden" defaultValue={csrfToken} />
          <label htmlFor="email">Email</label>
          <input
            type="email"
            id="email"
            placeholder="Хэрэглэгчийн Имэйл хаяг"
            className="border border-gray-300 rounded-md p-2"
            onChange={(e) => (emailRef.current = e.target.value)}
          />
          <label htmlFor="password">Password</label>
          <input
            type="password"
            id="password"
            placeholder="Нууц үг"
            className="border border-gray-300 rounded-md p-2"
            onChange={(e) => (passwordRef.current = e.target.value)}
          />
        </div>
        {error && <p className="text-red-500 text-xs">{error}</p>}
        <button
          onClick={onSubmit}
          type="submit"
          className="text-white bg-red-400 rounded-md p-2 mt-2 w-full"
        >
          Нэвтрэх
        </button>
      </form>
      <div className="w-full h-[1px] bg-gray-300 my-4"></div>
      <p className="text-sm">
        Шинээр бүртгэл үүсгэх үү?{" "}
        <Link href={"/auth/register"} className="underline">
          Бүртгүүлэх
        </Link>
      </p>
    </div>
  );
}

export default SignIn;
