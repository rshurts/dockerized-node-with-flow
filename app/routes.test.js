const request = require('supertest')

const app = require('./app')

test('GET /', () => {
  return request(app).get('/').then((res) => {
    expect(res.statusCode).toBe(200)
    expect(res.body).toEqual('Hello world!')
  })
})
