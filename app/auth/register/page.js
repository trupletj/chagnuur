import React from "react";
import Link from "next/link";

function Register() {
  return (
    <div className="w-full max-w-[600px] mx-auto rounded-xl  overflow-hidden p-10 h-full">
      <h1 className="text-4xl font-bold text-left mb-10">
        Шинээр бүртгэл үүсгэх
      </h1>
      <form
        className="space-y-4"
        method="post"
        action="/api/auth/callback/credentials"
      >
        <div className="flex flex-col space-y-2">
          {/* <input name="csrfToken" type="hidden" defaultValue={csrfToken} /> */}
          <label htmlFor="email">Email</label>
          <input
            type="email"
            id="email"
            placeholder="Хэрэглэгчийн Имэйл хаяг"
            className="border border-gray-300 rounded-md p-2"
            // onChange={(e) => (emailRef.current = e.target.value)}
          />
          <label htmlFor="password">Password</label>
          <input
            type="password"
            id="password"
            placeholder="Нууц үг"
            className="border border-gray-300 rounded-md p-2"
            // onChange={(e) => (passwordRef.current = e.target.value)}
          />
          <label htmlFor="password">Password</label>
          <input
            type="password"
            id="password"
            placeholder="Нууц үг"
            className="border border-gray-300 rounded-md p-2"
            // onChange={(e) => (passwordRef.current = e.target.value)}
          />
          <label htmlFor="password">Password</label>
          <input
            type="password"
            id="password"
            placeholder="Нууц үг"
            className="border border-gray-300 rounded-md p-2"
            // onChange={(e) => (passwordRef.current = e.target.value)}
          />
        </div>
        {/* {error && <p className="text-red-500 text-xs">{error}</p>} */}
        <button
          //  onClick={onSubmit}
          type="submit"
          className="text-white bg-red-300 rounded-md p-2 mt-2 w-full"
        >
          Бүртгүүлэх
        </button>
      </form>
      <div className="w-full h-[1px] bg-black my-4"></div>
      <p className="">
        Шинээр бүртгэл үүсгэх үү?{" "}
        <Link href={"/auth/register"} className="underline">
          Бүртгүүлэх
        </Link>
      </p>
    </div>
  );
}

export default Register;
