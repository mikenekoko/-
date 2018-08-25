<template>
  <div>
    <h1>矢印ゲーム！15回正解でクリアー！</h1>
    <div id="yajirusi">
      <p id="yajirusi_output">{{ message }}</p>
      <input id="yajirusi_form"
             @keydown.up="keyUp"
             @keydown.right="keyRight"
             @keydown.down="keyDown"
             @keydown.left="keyLeft"
             @keydown.space="gameStart">
      <p id="counter">正解数: {{ counter }}</p>
      <div id="clear_time">
        <p>クリアタイム：</p>
        <p>{{ timer }}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      targetId: '',
      timer: 0,
      counter: 0,
      message: 'Enterキーを押してね!',
      yajirusi: [
        {id: 0, icon: '↑'},
        {id: 1, icon: '→'},
        {id: 2, icon: '↓'},
        {id: 3, icon: '←'}
      ]
    }
  },
  methods: {
    keyUp () { this.checkKeyDown(0) },
    keyRight () { this.checkKeyDown(1) },
    keyDown () { this.checkKeyDown(2) },
    keyLeft () { this.checkKeyDown(3) },
    checkKeyDown (checkId) {
      if (this.targetId === checkId) {
        this.counter++
      } else {
        this.counter--
      }
      if (this.counter === 15) {
        this.message = 'ゲームクリア!'
      } else {
        this.changeYajirusi()
      }
    },
    gameStart () {
      this.changeYajirusi()
      this.timerStart()
    },
    timerStart () {
      var self = this
      setInterval(function () { self.timer++ }, 1000)
    },
    changeYajirusi () {
      this.targetId = this.randomseed()
      this.message = this.randomYajirusi(this.targetId)
    },
    randomseed () {
      return Math.floor(Math.random() * this.yajirusi.length)
    },
    randomYajirusi (targetId) {
      return this.yajirusi[targetId].icon
    }
  }
}
</script>

<style>
#yajirusi {
  display: flex;
  align-items: center;
  height: 200px;
  width: 800px;
  background-color: #444;
  color: #fff;
}
#yajirusi_form {
  height: 200px;
  width: 50px;
}
#yajirusi_output {
  font-size: 24px;
  font-weight: bold;
  text-align: center;
  width: 250px;
}
#counter {
  width: 150px;
  text-align: center;
}
#clear_time {
  height: 100%;
  width: 400px;
  background-color: #000;
}
#clear_time p:nth-of-type(2) {
  text-align: center;
  font-size: 50px;
}
</style>
