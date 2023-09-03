"use client";
import React from "react";

function BuyModal({ children, setShowBuyModal }) {
  return (
    <div className="relative z-50">
      <div className="fixed top-0 left-0 right-0 bottom-0 flex items-center justify-center  bg-gray-500 bg-opacity-75 transition-opacity">
        <div className="p-5 pt-10 w-full mx-5 rounded-2xl bg-white max-w-[600px] relative">
          <div className="">
            <button
              onClick={() => setShowBuyModal(false)}
              className="absolute top-2 right-2 w-8 h-8 flex items-center justify-center bg-red-400  rounded-full text-white"
            >
              X
            </button>
          </div>
          {children}
        </div>
      </div>
    </div>
  );
}

export default BuyModal;
