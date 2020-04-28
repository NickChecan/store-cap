/* global Vue axios */ //> from vue.html
const $ = sel => document.querySelector(sel)
const GET = (url) => axios.get('/catalog'+url)

const products = new Vue ({

    el:'#app',

    data: {
        list: [],
        product: { descr:'( click on a row to see details... )' }
    },

    methods: {

        search: ({target:{value:v}}) => products.fetch (v && '$search='+v),

        async fetch (_filter='') {
            const columns = 'ID,name,segment,price,currency'
            const {data} = await GET(`/Products?$select=${columns}&${_filter}`)
            products.list = data.value
        }

    }
})

// Get list of products on the app initialization
products.fetch()