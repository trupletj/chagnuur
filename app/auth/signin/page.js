import React from "react";

function SignIn() {
  return (
    <div className="fixed top-0 left-0 w-full h-screen flex items-center justify-center">
      <div className="w-full max-w-[600px] rounded-xl border overflow-hidden p-10">
        <h1 className="text-4xl font-bold text-center">Нэвтрэх</h1>
        <form className="space-y-4">
          <div className="flex flex-col space-y-2">
            <label htmlFor="email">Email</label>
            <input
              type="email"
              id="email"
              placeholder="Хэрэглэгчийн Имэйл хаяг"
              className="border border-gray-300 rounded-md p-2"
            />
            <label htmlFor="password">Password</label>
            <input
              type="password"
              id="password"
              placeholder="Нууц үг"
              className="border border-gray-300 rounded-md p-2"
            />
            <input
              type="submit"
              value="Нэвтрэх"
              className="text-white bg-red-300 rounded-md p-2 mt-2"
            />
          </div>
        </form>
      </div>
    </div>
  );
}

export default SignIn;
