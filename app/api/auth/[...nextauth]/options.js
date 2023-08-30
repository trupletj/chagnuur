import CredentialsProvider from "next-auth/providers/credentials";

export const options = {
  // Configure one or more authentication providers
  providers: [
    CredentialsProvider({
      name: "Sign in",
      credentials: {
        email: {
          label: "Email",
          type: "email",
          placeholder: "example@example.com",
        },
        password: { label: "Password", type: "password" },
      },
      async authorize(credentials) {
        const { email, password } = credentials;

        const response = await fetch("http://103.168.56.223/api/auth/login", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            email,
            password,
            is_api: 1,
          }),
        });

        const json = await response.json();

        if (json) {
          const { accessToken, user } = json;
          const newUser = { ...user, accessToken };
          return newUser;
        } else {
          return null;
        }
      },
    }),
    // ...add more providers here
  ],

  callbacks: {
    async jwt({ token, user }) {
      // the user object is what returned from the Credentials login, it has `accessToken` from the server `/login` endpoint
      // assign the accessToken to the `token` object, so it will be available on the `session` callback
      if (user) {
        token.accessToken = user.accessToken;
      }
      return token;
    },

    async session({ session, token }) {
      // the token object is what returned from the `jwt` callback, it has the `accessToken` that we assigned before
      // Assign the accessToken to the `session` object, so it will be available on our app through `useSession` hooks
      if (token) {
        session.accessToken = token.accessToken;
      }
      return session;
    },
  },
};
